{ lib
, buildPythonPackage
, fetchFromGitHub
, requests
,
}:

let

  json-ld = fetchFromGitHub {
    owner = "json-ld";
    repo = "json-ld.org";
    rev = "843a70e4523d7cd2a4d3f5325586e726eb1b123f";
    sha256 = "05j0nq6vafclyypxjj30iw898ig0m32nvz0rjdlslx6lawkiwb2a";
  };

  normalization = fetchFromGitHub {
    owner = "json-ld";
    repo = "normalization";
    rev = "aceeaf224b64d6880189d795bd99c3ffadb5d79e";
    sha256 = "125q5rllfm8vg9mz8hn7bhvhv2vqpd86kx2kxlk84smh33l8kbyl";
  };
in

buildPythonPackage rec {
  pname = "pyld";
  version = "1.0.5";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "digitalbazaar";
    repo = "pyld";
    rev = version;
    sha256 = "0z2vkllw8bvzxripwb6l757r7av5qwhzsiy4061gmlhq8z8gq961";
  };

  propagatedBuildInputs = [ requests ];

  # Unfortunately PyLD does not pass all testcases in the JSON-LD corpus. We
  # getting worse, at least.
  meta = {
    description = "Python implementation of the JSON-LD API";
    homepage = "https://github.com/digitalbazaar/pyld";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
