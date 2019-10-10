copy:
	rm -rf collections/ansible_collections/dragon
	mkdir collections/ansible_collections/dragon
	mkdir collections/ansible_collections/dragon/dragon
	cp -Ra plugins collections/ansible_collections/dragon/dragon/plugins
	cp -Ra roles collections/ansible_collections/dragon/dragon/roles

run:
	ANSIBLE_NOCOWS=1 ansible-playbook -i localhost, test.yml

inventory:
	ansible-inventory -i inventory.dragon.yml --list --export --playbook-dir=. -vvv

stuff: copy inventory run

install:
	ansible-galaxy collection build
	ansible-galaxy collection install dragon-dragon-0.0.1.tar.gz -p alan
	ANSIBLE_COLLECTIONS_PATHS=alan ansible-inventory -i inventory.dragon.yml --list --export --playbook-dir=. -vvv
