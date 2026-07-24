{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "awesomeversion";
  version = "25.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ludeeus";
    repo = "awesomeversion";
    tag = version;
    hash = "sha256-2CEuJagUkYwtjzpQLYLlz+V5e2feEU6di3wI0+uWuy4=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0"' 'version = "${version}"'
  '';

  build-system = [ hatchling ];

  pythonImportsCheck = [ "awesomeversion" ];

  meta = {
    description = "Python module to deal with versions";
    homepage = "https://github.com/ludeeus/awesomeversion";
    changelog = "https://github.com/ludeeus/awesomeversion/releases/tag/${src.tag}";
    license = lib.licenses.mit;
  };
}
