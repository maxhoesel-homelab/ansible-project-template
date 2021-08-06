# ansible-project-template

Template repository for my internal Ansible project.

To get started:

1. Create a repository from this template
2. If using Execution environments: Uncomment the push trigger in the `.github/workflows/ee`.yml workflow for automatic builds
3. Add your homelab AWX token in `inventory/group_bars/all/awx.yml`, if required
4. Update your dependencies in `requirements.yml` and `requirements.txt`, if required
5. Start writing playbooks! The default playbook is named `configure.yml`, but you can change this name.

To run a playbook locally:

1. Install `ansible-runner`
2. Build your EE container by running `tox`
3. Run the following command: `ansible-runner run --container-image quay.io/maxhoesel_homelab/ansible-project-<yourproject> -p playbook.yml ./`
