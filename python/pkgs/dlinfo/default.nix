{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "dlinfo";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fphammerle";
    repo = "python-dlinfo";
    tag = "v${version}";
    hash = "sha256-W9WfXU5eIMQQImzRgTJS0KL4IZfRtLrK8TYmdEc0VLI=";
  };

  build-system = [ setuptools-scm ];
  pythonImportsCheck = [ "dlinfo" ];

  meta = {
    description = "Python wrapper for libc's dlinfo and dyld_find on Mac";
    homepage = "https://github.com/fphammerle/python-dlinfo";
    license = lib.licenses.mit;
    maintainers = [ ];
    broken = stdenv.hostPlatform.isDarwin;
  };
}
