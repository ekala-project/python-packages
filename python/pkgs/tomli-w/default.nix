{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  tomli,
}:

buildPythonPackage rec {
  pname = "tomli-w";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hukkin";
    repo = "tomli-w";
    rev = version;
    hash = "sha256-Du37ySvAL9iwGec5wbWxwLTYm+kcDSOs5OJ5Sw7R87g=";
  };

  build-system = [ flit-core ];
  pythonImportsCheck = [ "tomli_w" ];

  meta = {
    description = "Write-only counterpart to Tomli, which is a read-only TOML parser";
    homepage = "https://github.com/hukkin/tomli-w";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
