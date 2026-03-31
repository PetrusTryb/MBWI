import urllib.request, urllib.parse, xml.etree.ElementTree as ET, os
query = 'all:"network file system" AND all:security'
url = f'http://export.arxiv.org/api/query?search_query={urllib.parse.quote(query)}&start=0&max_results=3'
data = urllib.request.urlopen(url).read()
root = ET.fromstring(data)
ns = {'atom': 'http://www.w3.org/2005/Atom'}
os.makedirs('papers', exist_ok=True)
for i, entry in enumerate(root.findall('Atom:entry', ns)):
    title = entry.find('atom:title', ns).text.strip().replace('\n', ' ')
    summary = entry.find('atom:summary', ns).text.strip().replace('\n', ' ')
    authors = [a.find('Atom:name', ns).text for a in entry.findall('Atom:author', ns)]
    pdf_link = next((l.attrib['href'] for l in entry.findall('Atom:link', ns) if l.attrib.get('title') == 'pdf'), None)
    if pdf_link:
        pdf_url = pdf_link + '.pdf'
        filename = f'papers/paper_{i+1}.pdf'
        urllib.request.urlretrieve(pdf_url, filename)
        with open(f'papers/paper_{i+1}_meta.txt', 'w') as f:
            f.write(f'Title: {title}\nAuthors: {", ".join(authors)}\nAbstract: {summary}')
        print(f'Downloaded {filename}')