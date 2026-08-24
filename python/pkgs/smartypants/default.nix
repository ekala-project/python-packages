{
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "smartypants";
  version = "2.0.2";
  pyproject = true;

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "leohemsted";
    repo = "smartypants.py";
    tag = "v${version}";
    hash = "sha256-jSGiT36Rr0P6eEWZIHtMj4go3KGDRaF2spLxLNruDec=";
  };

  build-system = [ setuptools ];

}
