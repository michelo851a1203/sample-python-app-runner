.phony:
	run
	test

run:
	@echo "start fastapi server ..."
	PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 uv run main.py

