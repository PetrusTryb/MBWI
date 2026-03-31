import urllib.request
import urllib.parse
import xml.etree.ElementTree as ET
import os

query = 'all:"network file system" AND all:security'
url = f'http://export.arxiv.org/api/query?search_query={urllib.parse.quote(query)}&start=0&max_results=3'

print(f"Fetching {url}")
response = urllib.request.urlopen(url)
data = response.read()

root = ET.fromstring(data)
ns = {'atom': 'http://www.w3.org/2005/Atom'}

os.makedirs('papers', exist_ok=True)

for i, entry in enumerate(root.findall('atom:entry', ns)):
    title = entry.find('atom:title', ns).text.strip().replace('\n', ' ')
    summary = entry.find('atom:summary', ns).text.strip().replace('\n', ' ')
    authors = [author.find('atom:name', ns).text for author in entry.findall('atom:author', ns)]
    published = entry.find('atom:published', ns).text
    pdf_link = next((link.attrib['href'] for link in entry.findall('atom:link', ns) if link.attrib.get('title') == 'pdf'), None)
    
    print(f"[{i+1}] {title}")
    print(f"Authors: {', '.join(authors)}")
    print(f"Published: {published}")
    
    if pdf_link:
        pdf_url = pdf_link + '.pdf'
        print(f"Downloading {pdf_url}...")
        try:
            filename = f"papers/paper_{i+1}.pdf"
            urllib.request.urlretrieve(pdf_url, filename)
            
            with open(f"papers/paper_{i+1}_meta.txt", "w") as f:
                f.write(f"Title: {title}\n")
                f.write(f"Authors: {', '.join(authors)}\n")
                f.write(f"Published: {published}\n")
                f.write(f"Abstract: {summary}\n")
                
            print(f"Saved to {filename}")
        except Exception as e:
            print(f"Failed to download: {e}")
    print("---")
