{
  lib,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "cattrs";
  version = "26.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-attrs";
    repo = "cattrs";
    tag = "v${version}";
    hash = "sha256-YJYmPpvZ6B/0zniwLZPSIRAz0afqrQP74JfY/hgrogw=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    attrs
    typing-extensions
  ];

  pythonImportsCheck = [ "cattr" ];

  meta = {
    description = "Python custom class converters for attrs";
    homepage = "https://github.com/python-attrs/cattrs";
    license = with lib.licenses; [ mit ];
  };
}
