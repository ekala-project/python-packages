{ lib
, buildPythonPackage
, dnspython
, fetchPypi
, geoip2
, ipython
, isPyPy
, setuptools
, praw
, pyenchant
, pytz
, sqlalchemy
, xmltodict
, importlib-metadata
, packaging
,
}:

buildPythonPackage rec {
  pname = "sopel";
  version = "8.0.4";
  pyproject = true;

  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-16QDzsZCquAPH3FPyBjxeXGcvSdjYLZFTXN0ASneROU=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools~=66.1" "setuptools"
  '';

  dependencies = [
    dnspython
    geoip2
    ipython
    praw
    pyenchant
    pytz
    sqlalchemy
    xmltodict
    importlib-metadata
    packaging
  ];

  pythonRemoveDeps = [ "sopel-help" ];

  pythonRelaxDeps = [
    "sqlalchemy"
    "xmltodict"
  ];

  pythonImportsCheck = [ "sopel" ];

  meta = {
    description = "Simple and extensible IRC bot";
    homepage = "https://sopel.chat";
    license = lib.licenses.efl20;
    maintainers = [ ];
    mainProgram = "sopel";
  };
}
