{ buildPythonPackage
, fetchFromGitHub
,
}:

buildPythonPackage rec {
  version = "2.0.1";
  format = "setuptools";
  pname = "path-and-address";

  src = fetchFromGitHub {
    owner = "joeyespo";
    repo = "path-and-address";
    rev = "v${version}";
    sha256 = "0b0afpsaim06mv3lhbpm8fmawcraggc11jhzr6h72kdj1cqjk5h6";
  };

}
