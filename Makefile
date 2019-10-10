copy:
	rm -rf collections/ansible_collections/dragon
	mkdir collections/ansible_collections/dragon
	mkdir collections/ansible_collections/dragon/dragon
	cp -Ra plugins collections/ansible_collections/dragon/dragon/plugins

inventory:
	ansible-inventory -i inventory.dragon.yml --list --export --playbook-dir=. -vvv

stuff: copy inventory

install:
	ansible-galaxy collection build
	ansible-galaxy collection install dragon-dragon-0.0.1.tar.gz -p alan
	ANSIBLE_COLLECTIONS_PATHS=alan ansible-inventory -i inventory.dragon.yml --list --export --playbook-dir=. -vvv
