VENV		= venv
VENV_PYTHON = $(VENV)/bin/python3
VENV_PIP	= $(VENV)/bin/pip3

all: install run

$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	touch $(VENV)/bin/activate

install: $(VENV)/bin/activate

run: install
	$(VENV_PYTHON) main.py

clean:
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} +

.PHONY: all install run clean