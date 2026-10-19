{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  jinja2,
  six,
}:

buildPythonPackage rec {
  pname = "mplleaflet";
  version = "0.0.5";
  pyproject = true;

  dependencies = [
    jinja2
    six
  ];

  # No tests in archive

  src = fetchPypi {
    inherit pname version;
    sha256 = "049e0b91797ce5b462853395138161fed9e8dfc1f4723f482ebb0739a0bbd289";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Convert Matplotlib plots into Leaflet web maps";
    homepage = "https://github.com/jwass/mplleaflet";
    license = lib.licenses.bsd3;
  };
}
