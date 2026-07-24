{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "filetype";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZrVs1kdL9B2MVGYDR9N6/MP30ZcGSN42XBAu93VIqts=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "filetype" ];

  meta = {
    description = "Infer file type and MIME type of any file/buffer";
    homepage = "https://github.com/h2non/filetype.py";
    license = lib.licenses.mit;
  };
}
