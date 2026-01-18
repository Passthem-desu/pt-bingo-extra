import zipfile
from pathlib import Path

target = Path(__file__).parent.parent
dist_folder = target / "dist"
dist = dist_folder / "pt-bingo-extra.zip"

dist_folder.mkdir(exist_ok=True)

dist.unlink(missing_ok=True)

with zipfile.ZipFile(dist, 'w', zipfile.ZIP_DEFLATED) as zipf:
    zipf.write(target / "pack.mcmeta", arcname="pack.mcmeta")
    for file in (target / "data").rglob("*"):
        relative_path = file.relative_to(target)
        zipf.write(file, arcname=relative_path)
