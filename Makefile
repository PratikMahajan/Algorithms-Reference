.PHONY: refresh-readme \
	publish

publish:
	@read -p "Add Commit Message:"  commitm; \
	echo "Adding Commit message as $${commitm}"
	git add . \ 
	git commit -m "$${commitm}" \
	git push
