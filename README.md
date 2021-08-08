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
   - Temporary Hack: Install the ansible collection requirements on your local host with `ansible-galaxy install -r requirements.yml --force`. The EE container does contain the required collections, but I'm not sure how to tell ansible-runner to use them.
3. Create a folder `env` for ansible-runner - this is where you can provide optional parameters to ansible-runner and your playbook:
   - Create a file called `cmdline` with the following contents: `--ask-vault-pass`
   - Create a file called `passwords` with the following contents:
     ```yaml
     ---
     "^Vault password:\\s*?$": "your-projects-vault-password"
     ```
   - This step is required for ansible-runner to pick up and supply your vault password. Note that the `env` folder is always ignored in the gitinore to prevent accidental secret leaks.
3. Run the following command: `ansible-runner run --container-image quay.io/maxhoesel_homelab/ansible-project-<yourproject> -p playbook.yml ./`
