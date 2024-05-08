UTILS_SOURCED=${UTILS_SOURCED:-false}
if [[ $UTILS_SOURCED = "false" ]]; then
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
fi

export UTILS_SOURCED=true
