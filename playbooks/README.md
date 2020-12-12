## Installing ansible-galaxy devsec

ansible-galaxy collection install -r requirements.yaml

## Using playbook
ansible-playbook -i "$IP", install-docker.yml -e ansible_ssh_user=$user
