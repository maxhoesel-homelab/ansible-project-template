# ansible-project-template

Template repository for my internal Ansible project.

To get started:

1. Create a repository from this template
2. If using Execution environments:
    - Add the Quay.io credentials to the repository
    - Uncomment the push trigger in the `.github/workflows/ee`.yml workflow
3. Add your homelab AWX token in `inventory/group_bars/all/awx.yml`, if required
4. Update your dependencies in `requirements.yml` and `requirements.txt`, if required
5. Start writing playbooks! The default playbook is named `configure.yml`, but you can change this name.
