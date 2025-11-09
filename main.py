from fastapi import FastAPI
import uvicorn
import os

app = FastAPI(title="demo app", description="demo app sample", version="1.0.0")

@app.get("/")
def root():
    return { "status": "OK" }

def main():
    uvicorn.run(
            app, 
            host="0.0.0.0", 
            port=8080, 
            log_level=os.getenv("Log_LEVEL", "info"),
            proxy_headers=True, 
        )

if __name__ == "__main__":
    main()
