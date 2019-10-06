.PHONY: refresh \
	publish \
	rollout \
	git

rollout:
	@if [ -z "${m}" ]; then echo "Message must be set, use 'make publish m=your_message'"; exit 1; fi

publish: rollout refresh git


git:
	git add . 
	git commit -m "$m"
	git push 

refresh: topics

topics:
	jupyter nbconvert Notebooks/*.ipynb --to markdown
	mv Notebooks/*.md .
	rm Scrapebook.md	

