prepend_to_PATH() {
	for d; do
		d=$({ cd -- "$d" && { pwd -P || pwd; }; } 2>/dev/null) # canonicalize symbolic links
		if [ -d "$d" ]; then
			case ":$PATH:" in
			*":$d:"*) : ;;
			*)
				PATH="$d:$PATH"
				;;
			esac
		fi # skip nonexistent directory
	done
}

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
