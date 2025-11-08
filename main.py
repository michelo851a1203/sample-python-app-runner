from fastapi import FastAPI
import uvicorn

app = FastAPI(title="demo app", description="demo app sample", version="1.0.0")

@app.get("/")
def root():
    return { "status": "OK" }

def main():
    uvicorn.run(app, host="0.0.0.0", port=8080)

if __name__ == "__main__":
    main()
