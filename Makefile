.PHONY: refresh-readme \
	publish \
	push \
	read 

publish: read push

read:
	@read -p "Add Commit Message:"  MESSAGE

push:
	@echo $(MESSAGE)
	git add . 
	git commit -m "$MESSAGE"
	git push
