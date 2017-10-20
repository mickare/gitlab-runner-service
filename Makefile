ServiceName := gitlab-runner
FileName := ${ServiceName}.service

.PHONY: install uninstall start stop reload register

install: stop
	-sudo systemctl disable ${ServiceName}
	sudo cp -f /opt/gitlab-runner/${FileName} /etc/systemd/system/${FileName}
	sudo systemctl --system daemon-reload
	sudo systemctl enable ${ServiceName}
	${MAKE} start

uninstall: stop
	sudo systemctl disable ${ServiceName}
	sudo rm -f /etc/systemd/system/${FileName}
	sudo systemctl --system daemon-reload

start:
	sudo systemctl start ${ServiceName}

stop:
	-sudo systemctl stop ${ServiceName}

reload:
	sudo systemctl --system daemon-reload

register:
	docker exec -it gitlabrunner_gitlab-runner_1 /bin/bash -c "gitlab-runner register"