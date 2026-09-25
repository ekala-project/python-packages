{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  polib,
  click,
}:

buildPythonPackage rec {
  pname = "lingua";
  version = "4.16.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-seXLu+zUCv057z1Py0Dk4/yblrwOBD5wiESm0ibuVL0=";
  };

  postPatch = ''
    substituteInPlace src/lingua/extract.py \
      --replace-fail SafeConfigParser ConfigParser

    # Replace uv_build backend with flit_core
    sed -i 's/requires = \["uv_build[^"]*"\]/requires = ["flit_core>=3.2,<4"]/' pyproject.toml
    substituteInPlace pyproject.toml \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "flit_core.buildapi"'
  '';

  build-system = [ flit-core ];

  propagatedBuildInputs = [
    click
    polib
  ];

  pythonImportsCheck = [ "lingua" ];

  meta = {
    description = "Translation toolset";
    homepage = "https://github.com/wichert/lingua";
    license = lib.licenses.bsd3;
  };
}
