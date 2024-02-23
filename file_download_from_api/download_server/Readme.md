**Download Server**

A simple Node.js/Express server providing a file download API.

**Features**

* Single endpoint for convenience: `/api/download`
* Supports both PDF and Excel file downloads
* Flexible file delivery based on query parameters

**Prerequisites**

* Node.js and npm (or yarn)

**Setup**

1. **Open a terminal in this directory**

```bash
cd download_server
```

2. **Install Dependencies**

```bash
npm install
```

3. **Run the server**

```bash
node index.js
```

The server will start on port 5001.

**Usage**

Make a GET request to the /api/download endpoint, specifying the desired file type using the type query parameter:

1. **Download PDF:**

```
http://localhost:5001/api/download?type=pdf 
```

2. **Download Excel sheet:**

```
http://localhost:5001/api/download?type=excel
```




