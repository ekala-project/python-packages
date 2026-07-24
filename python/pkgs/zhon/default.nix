{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "zhon";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tsroten";
    repo = "zhon";
    tag = "v${version}";
    hash = "sha256-ghZp+5YXmTWf1EJKvdSlqccnxnaLliYR5HxX5DcWXiw=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "zhon" ];

  meta = {
    description = "Constants used in Chinese text processing";
    homepage = "https://github.com/tsroten/zhon";
    license = lib.licenses.mit;
  };
}
