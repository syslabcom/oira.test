from setuptools import setup, find_packages
import os

version = '0.1dev'

setup(name='oira.test',
      version=version,
      description="OiRA test package",
      long_description=open("README.txt").read() + "\n" +
                       open(os.path.join("docs", "HISTORY.txt")).read(),
      # Get more strings from
      # http://pypi.python.org/pypi?:action=list_classifiers
      classifiers=[
        "Framework :: Plone",
        "Programming Language :: Python",
        ],
      keywords='',
      author='',
      author_email='',
      url='https://github.com/syslabcom/oira.test',
      license='GPL',
      packages=find_packages('src', exclude=['ez_setup']),
      package_dir={'': 'src'},
      namespace_packages=['oira'],
      include_package_data=True,
      zip_safe=False,
      extras_require={
        'test': [
                 ],
      },
      install_requires=[
        'setuptools',
        'osha.oira',
        'robotsuite',
        'decorator',
        'docutils',
        'selenium',
        'robotframework-selenium2library',
      ],
      entry_points="""
      [z3c.autoinclude.plugin]
      target = plone
      """,
      setup_requires=[],
      paster_plugins=[],
      )

