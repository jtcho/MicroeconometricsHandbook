
all: prepare

prepare:
	xelatex --shell-escape microeconometrics.tex

view: prepare
	open -a Skim microeconometrics.pdf

develop: prepare
	fswatch -i 'microeconometrics.tex' -e '.*' . | xargs -t -n1 -I % bash -c "xelatex --shell-escape % || osascript -e 'display notification \"Latex compilation failed\" with title \"ERROR\"'"

clean:
	rm -rf *.aux *.listing *.pdf *.out *.log _minted-microeconometrics
