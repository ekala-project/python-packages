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
  version = "25.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-attrs";
    repo = "cattrs";
    tag = "v${version}";
    hash = "sha256-6oQblSanvSZOMD5ossCP7fNjyxF54SRbU1cQrW1I5Ps=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    attrs
    typing-extensions
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "-l --benchmark-sort=fullname --benchmark-warmup=true --benchmark-warmup-iterations=5  --benchmark-group-by=fullname" ""
  '';

  pythonImportsCheck = [ "cattr" ];

  meta = {
    description = "Python custom class converters for attrs";
    homepage = "https://github.com/python-attrs/cattrs";
    license = with lib.licenses; [ mit ];
  };
}
