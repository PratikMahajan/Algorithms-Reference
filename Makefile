.PHONY: refresh-readme \
	publish

publish: refresh git

git:
	git add . 
	git commit -m "$m"
	git push 

refresh: readme rename

readme:
	jupyter nbconvert Algorithms.ipynb --to markdown

rename:
	mv Algorithms.md README.md	
