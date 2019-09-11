.PHONY: refresh \
	publish \
	rollout \
	git \
	rename \
	readme

rollout:
	@if [ -z "${m}" ]; then echo "Message must be set, use 'make publish m=your_message'"; exit 1; fi

publish: rollout refresh git


git:
	git add . 
	git commit -m "$m"
	git push 

refresh: readme rename

readme:
	jupyter nbconvert Algorithms.ipynb --to markdown

rename:
	mv Algorithms.md README.md	