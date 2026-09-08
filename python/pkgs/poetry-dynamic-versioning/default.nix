{
  lib,
  buildPythonPackage,
  dunamai,
  fetchFromGitHub,
  jinja2,
  poetry-core,
  poetry,
  tomlkit,
}:

buildPythonPackage rec {
  pname = "poetry-dynamic-versioning";
  version = "1.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mtkennerly";
    repo = "poetry-dynamic-versioning";
    tag = "v${version}";
    hash = "sha256-sETUaOKFS0T4o++W1maKt7qsy0CdnmMQT7vegNKQCbk=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    dunamai
    jinja2
    tomlkit
  ];
  # virtualenv: error: argument dest: the destination . is not write-able at /
  doCheck = false;
  pythonImportsCheck = [ "poetry_dynamic_versioning" ];

  setupHook = ./setup-hook.sh;

  meta = {
    description = "Plugin for Poetry to enable dynamic versioning based on VCS tags";
    mainProgram = "poetry-dynamic-versioning";
    homepage = "https://github.com/mtkennerly/poetry-dynamic-versioning";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
