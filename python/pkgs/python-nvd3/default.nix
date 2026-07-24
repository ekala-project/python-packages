{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python-slugify,
  jinja2,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-nvd3";
  version = "0.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "areski";
    repo = "python-nvd3";
    tag = "v${version}";
    hash = "sha256-+J0lHAOjX3hbymjESQ6WpEnly+1Lv9o0ucIpBxTuS6s=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-slugify
    jinja2
  ];
  meta = {
    description = "Python Wrapper for NVD3";
    homepage = "https://github.com/areski/python-nvd3";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "nvd3";
  };
}
