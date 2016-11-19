# invoiceplane

A image for InvoicePlane based on Alpine Linux. No external services required.

## Usage

Run the image:

```
docker run -v invoicedata:/data -p 8888:8888 -e TZ=Europe/London jgillich/invoiceplane
```

Then open `http://localhost:8888/` and the setup should appear. The database
configuration is printed to the console.