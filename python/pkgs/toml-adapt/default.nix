{
  lib,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  poetry-core,
  toml,
}:

buildPythonPackage rec {
  pname = "toml-adapt";
  version = "0.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "firefly-cpp";
    repo = "toml-adapt";
    tag = version;
    hash = "sha256-GtwE8P4uP3F6wOrzv/vZ4CJR4tzF7CxpWV/8X/hBZhc=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    click
    toml
  ];

  pythonImportsCheck = [ "toml_adapt" ];

  meta = {
    description = "Simple Command-line interface for manipulating toml files";
    homepage = "https://github.com/firefly-cpp/toml-adapt";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "toml-adapt";
  };
}
