#!/bin/bash
#
# ARG_OPTIONAL_SINGLE([dockerfile],[f],[docker file to build image from],[Dockerfile-light])
# ARG_OPTIONAL_SINGLE([uri],[u],[docker repository URI],[bmckinley\/packeransible])
# ARG_OPTIONAL_SINGLE([tag],[t],[docker image tag (e.g., light, latest)],[light])
# ARG_OPTIONAL_SINGLE([packerversion],[v],[packer version to use],[1.3.2])
# ARG_HELP([build and deploy packer])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.6.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate

# When called, the process ends.
# Args:
# 	$1: The exit message (print to stderr)
# 	$2: The exit code (default is 1)
# if env var _PRINT_HELP is set to 'yes', the usage is print to stderr (prior to )
# Example:
# 	test -f "$_arg_infile" || _PRINT_HELP=yes die "Can't continue, have to supply file as an argument, got '$_arg_infile'" 4
die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}

# Function that evaluates whether a value passed to it begins by a character
# that is a short option of an argument the script knows about.
# This is required in order to support getopts-like short options grouping.
begins_with_short_option()
{
	local first_option all_short_options
	all_short_options='futvh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}



# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_dockerfile="Dockerfile-light"
_arg_uri="bmckinley\/packeransible"
_arg_tag="light"
_arg_packerversion="1.3.2"

# Function that prints general usage of the script.
# This is useful if users asks for it, or if there is an argument parsing error (unexpected / spurious arguments)
# and it makes sense to remind the user how the script is supposed to be called.
print_help ()
{
	printf '%s\n' "build and deploy packer"
	printf 'Usage: %s [-f|--dockerfile <arg>] [-u|--uri <arg>] [-t|--tag <arg>] [-v|--packerversion <arg>] [-h|--help]\n' "$0"
	printf '\t%s\n' "-f,--dockerfile: docker file to build image from (default: 'Dockerfile-light')"
	printf '\t%s\n' "-u,--uri: docker repository URI (default: 'bmckinley\/packeransible')"
	printf '\t%s\n' "-t,--tag: docker image tag (e.g., light, latest) (default: 'light')"
	printf '\t%s\n' "-v,--packerversion: packer version to use (default: '1.3.2')"
	printf '\t%s\n' "-h,--help: Prints help"
}

# The parsing of the command-line
parse_commandline ()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			# We support whitespace as a delimiter between option argument and its value.
			# Therefore, we expect the --dockerfile or -f value.
			# so we watch for --dockerfile and -f.
			# Since we know that we got the long or short option,
			# we just reach out for the next argument to get the value.
			-f|--dockerfile)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_dockerfile="$2"
				shift
				;;
			# We support the = as a delimiter between option argument and its value.
			# Therefore, we expect --dockerfile=value, so we watch for --dockerfile=*
			# For whatever we get, we strip '--dockerfile=' using the ${var##--dockerfile=} notation
			# to get the argument value
			--dockerfile=*)
				_arg_dockerfile="${_key##--dockerfile=}"
				;;
			# We support getopts-style short arguments grouping,
			# so as -f accepts value, we allow it to be appended to it, so we watch for -f*
			# and we strip the leading -f from the argument string using the ${var##-f} notation.
			-f*)
				_arg_dockerfile="${_key##-f}"
				;;
			# See the comment of option '--dockerfile' to see what's going on here - principle is the same.
			-u|--uri)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_uri="$2"
				shift
				;;
			# See the comment of option '--dockerfile=' to see what's going on here - principle is the same.
			--uri=*)
				_arg_uri="${_key##--uri=}"
				;;
			# See the comment of option '-f' to see what's going on here - principle is the same.
			-u*)
				_arg_uri="${_key##-u}"
				;;
			# See the comment of option '--dockerfile' to see what's going on here - principle is the same.
			-t|--tag)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_tag="$2"
				shift
				;;
			# See the comment of option '--dockerfile=' to see what's going on here - principle is the same.
			--tag=*)
				_arg_tag="${_key##--tag=}"
				;;
			# See the comment of option '-f' to see what's going on here - principle is the same.
			-t*)
				_arg_tag="${_key##-t}"
				;;
			# See the comment of option '--dockerfile' to see what's going on here - principle is the same.
			-v|--packerversion)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_packerversion="$2"
				shift
				;;
			# See the comment of option '--dockerfile=' to see what's going on here - principle is the same.
			--packerversion=*)
				_arg_packerversion="${_key##--packerversion=}"
				;;
			# See the comment of option '-f' to see what's going on here - principle is the same.
			-v*)
				_arg_packerversion="${_key##-v}"
				;;
			# The help argurment doesn't accept a value,
			# we expect the --help or -h, so we watch for them.
			-h|--help)
				print_help
				exit 0
				;;
			# We support getopts-style short arguments clustering,
			# so as -h doesn't accept value, other short options may be appended to it, so we watch for -h*.
			# After stripping the leading -h from the argument, we have to make sure
			# that the first character that follows coresponds to a short option.
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

# Now call all the functions defined above that are needed to get the job done
parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
# ] <-- needed because of Argbash
