function customize_aliases {
	alias ac="ant compile"
	alias acc="ant clean compile"
	alias ad="ant deploy"
	alias af="ant format-source"
	alias afcb="ant format-source-current-branch"

	alias cdt="cd ~/dev/projects/liferay-portal"

	alias d="docker"

	alias g="git"
	alias gi="gpr info"
	alias gg="git_grep"
	alias gpr="~/dev/projects/git-tools/git-pull-request/git-pull-request.sh"

	alias la="ls -la --group-directories-first"

	alias osub="/opt/sublime_text/sublime_text ${@}"
}

function customize_path {
	export ANT_HOME="/opt/java/ant"
	export ANT_OPTS="-Xmx6144m"

	export GRADLE_OPTS=${ANT_OPTS}

	if [ -z ${JAVA_HOME+x} ]
	then
		export JAVA_HOME="/opt/java/jdk"
	fi

	export NPM_CONFIG_PREFIX=~/.npm-global

	export PATH="${ANT_HOME}/bin:${JAVA_HOME}/bin:${NPM_CONFIG_PREFIX}/bin:${PATH}"
}

function customize_prompt {
	PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] \$(parse_git_current_branch_with_parantheses)\n\$ "
}

function disable_history {
	unset HISTFILE
}

function execute_gradlew {
	if [ -e ../gradlew ]
	then
		../gradlew ${@}
	elif [ -e ../../gradlew ]
	then
		../../gradlew ${@}
	elif [ -e ../../../gradlew ]
	then
		../../../gradlew ${@}
	elif [ -e ../../../../gradlew ]
	then
		../../../../gradlew ${@}
	elif [ -e ../../../../../gradlew ]
	then
		../../../../../gradlew ${@}
	elif [ -e ../../../../../../gradlew ]
	then
		../../../../../../gradlew ${@}
	elif [ -e ../../../../../../../gradlew ]
	then
		../../../../../../../gradlew ${@}
	elif [ -e ../../../../../../../../gradlew ]
	then
		../../../../../../../../gradlew ${@}
	elif [ -e ../../../../../../../../../gradlew ]
	then
		../../../../../../../../../gradlew ${@}
	else
		echo "Unable to find locate Gradle wrapper."
	fi
}

function git_grep {
	if [ ${#} -eq 1 ]
	then
		git --no-pager grep --files-with-matches "${1}"
	elif [ ${#} -eq 2 ]
	then
		git --no-pager grep --files-with-matches "${1}" -- "${2}"
	elif [ ${#} -eq 3 ]
	then
		git --no-pager grep --files-with-matches "${1}" -- "${2}" "${3}"
	elif [ ${#} -eq 4 ]
	then
		git --no-pager grep --files-with-matches "${1}" -- "${2}" "${3}" "${4}"
	fi
}

function gw {
	execute_gradlew "${@//\//:}" --daemon
}

function parse_git_branch {
	GIT_DIR_NAME=$(git rev-parse --show-toplevel)

	GIT_DIR_NAME=${GIT_DIR_NAME##*/}

	if [[ "${GIT_DIR_NAME}" =~ -ee-[0-9][^\-]*$ ]]
	then
		echo "ee-${GIT_DIR_NAME##*-ee-}"
	elif [[ "${GIT_DIR_NAME}" =~ -[0-9][^\-]*$ ]]
	then
		echo "${GIT_DIR_NAME##*-}"
	elif [[ "${GIT_DIR_NAME}" =~ com-liferay-osb-asah-private$ ]]
	then
		echo "7.0.x"
	elif [[ "${GIT_DIR_NAME}" =~ -private$ ]]
	then
		echo "${GIT_DIR_NAME}" | sed 's/.*-\([^\-]*\)-private$/\1-private/'
	else
		echo "master"
	fi
}

function parse_git_current_branch {
	git rev-parse --abbrev-ref HEAD 2>/dev/null
}

function parse_git_current_branch_with_parantheses {
	parse_git_current_branch | sed 's/.*/(&)/'
}

function switch_to_java_7 {
	export JAVA_HOME="/opt/java/jdk7"

	export PATH="${JAVA_HOME}/bin:${PATH}"
}

customize_aliases
customize_path
customize_prompt
disable_history