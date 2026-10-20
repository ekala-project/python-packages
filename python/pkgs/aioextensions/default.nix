{
  buildPythonPackage,
  fetchPypi,
  # build-system
  poetry-core,
  lib,

  # Python dependencies
  uvloop,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "aioextensions";
  version = "21.7.2261349";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "2eacc52692495f331437e8c8e9782ca71f4617ec84f174ca17acdd77631efc47";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"poetry==1.0.9"' '"poetry-core"' \
      --replace-fail "poetry.masonry.api" "poetry.core.masonry.api"
  '';

  build-system = [ poetry-core ];

  dependencies = [ uvloop ];

  nativeCheckInputs = [ pytest ];
  checkPhase = ''
    cd test/
    pytest
  '';

  meta = {
    description = "High performance functions to work with the async IO";
    homepage = "https://kamadorueda.github.io/aioextensions";
    license = lib.licenses.mit;
  };
})
