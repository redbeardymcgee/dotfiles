if [[ $UTILS_SOURCED = "true" ]]; then
	echo "utils.sh: already sourced"
	exit
fi

pathmunge() {
	d=$({ cd -- "$1" && { pwd -P || pwd; }; } 2>/dev/null) # canonicalize symbolic links
	case ":${PATH}:" in
	*:"$d":*) ;;
	*)
		if [ "$2" = "after" ]; then
			PATH=$PATH:$d
		else
			PATH=$d:$PATH
		fi
		;;
	esac
}

export UTILS_SOURCED=true
