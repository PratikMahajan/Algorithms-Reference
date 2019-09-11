.PHONY: refresh-readme \
	publish

publish: refresh-readme git

git:
	git add . 
	git commit -m "$m"
	git push 


