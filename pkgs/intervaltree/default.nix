{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "intervaltree";
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8/fouut911ufem0zzz7BACWYSo5m4wFtU35SEwxzz+I=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail ', "uv-dynamic-versioning"' "" \
      --replace-fail "dynamic = ['version']" 'version = "${version}"' \
      --replace-fail 'source = "uv-dynamic-versioning"' ""
  '';

  build-system = [ hatchling ];

  dependencies = [ sortedcontainers ];

  pythonImportsCheck = [ "intervaltree" ];

  doCheck = false;

  meta = {
    description = "Editable interval tree data structure for Python 2 and 3";
    homepage = "https://github.com/chaimleib/intervaltree";
    license = lib.licenses.asl20;
  };
}
