{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "colorful";
  version = "0.5.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "timofurrer";
    repo = "colorful";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nztVTfBimRDXwPYk3LNMZKa1ItbgqM2ukgZs8hI8TwE=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "colorful" ];

  passthru.updateScript = gitUpdater {
    # Drop the "v" tag prefix before version comparison.
    rev-prefix = "v";
    # Skip PEP 440 pre-release tags.
    ignoredVersions = "(a|b|rc)[0-9]+$";
  };

  meta = {
    description = "Library for terminal string styling";
    homepage = "https://github.com/timofurrer/colorful";
    license = lib.licenses.mit;
  };
})
