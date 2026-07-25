{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  marshmallow,
  poetry-core,
  poetry-dynamic-versioning,
  typing-inspect,
}:

buildPythonPackage rec {
  pname = "dataclasses-json";
  version = "0.6.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lidatong";
    repo = "dataclasses-json";
    tag = "v${version}";
    hash = "sha256-AH/T6pa/CHtQNox67fqqs/BBnUcmThvbnSHug2p33qM=";
  };

  patches = [
    ./marshmallow-4.0-compat.patch
    # https://github.com/lidatong/dataclasses-json/pull/565
    ./python-3.14-compat.patch
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'documentation =' 'Documentation =' \
      --replace-fail 'version = "0.0.0"' 'version = "${version}"'
  '';

  build-system = [
    poetry-core
    poetry-dynamic-versioning
  ];

  pythonRelaxDeps = [ "marshmallow" ];

  dependencies = [
    typing-inspect
    marshmallow
  ];
  pythonImportsCheck = [ "dataclasses_json" ];

  meta = {
    description = "Simple API for encoding and decoding dataclasses to and from JSON";
    homepage = "https://github.com/lidatong/dataclasses-json";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
