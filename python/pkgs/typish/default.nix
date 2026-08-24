{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, pythonAtLeast
,
}:

buildPythonPackage (finalAttrs: {
  pname = "typish";
  version = "1.9.3";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "ramonhagenaars";
    repo = "typish";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LnOg1dVs6lXgPTwRYg7uJ3LCdExYrCxS47UEJxKHhVU=";
  };

  build-system = [ setuptools ];

  # TypeError: 'member_descriptor' object is not iterable
  disabled = pythonAtLeast "3.14";

  pythonImportsCheck = [ "typish" ];

  meta = {
    description = "Python module for checking types of objects";
    homepage = "https://github.com/ramonhagenaars/typish";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
