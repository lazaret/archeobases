# -*- coding: utf-8 -*-
import virtualenv, textwrap
output = virtualenv.create_bootstrap_script(textwrap.dedent("""
def adjust_options(options, args):
    options.no_site_packages = True
    options.use_distribute = True  

def after_install(options, home_dir):
    devnull = open(os.devnull, 'w')
    # install packaging and developement tools
    print "--- Install developement tools ---"
    print "=> Update distribute"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                     'install', '-U', 'distribute'], stdout=devnull)
    print "=> Update pip"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                     'install', '-U', 'pip'], stdout=devnull)
    print "=> Install coverage"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'coverage'], stdout=devnull)
    print "=> Install nose"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'nose'], stdout=devnull)
    print "=> Install pylint"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'pylint'], stdout=devnull, stderr=devnull)
    print "=> Install Cheesecake"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'Cheesecake'], stdout=devnull, stderr=devnull)
    print "=> Install Bitten 0.6b2"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'http://ftp.edgewall.org/pub/bitten/Bitten-0.6b2.tar.gz'], stdout=devnull)
    # install Pylons
    print "--- Install Pylons and project depedencies ---"
    print "=> Install Pylons 1.0"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'Pylons==1.0'], stdout=devnull)
    print "=> Install Babel"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'Babel'], stdout=devnull)
    print "=> Install SQLAlchemy"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'SQLalchemy'], stdout=devnull)
    print "=> Install FormAlchemy"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'FormAlchemy'], stdout=devnull)
    print "=> Install repoze.what"
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'repoze.what-pylons'], stdout=devnull)
    subprocess.call([join(home_dir, 'bin', 'pip'),
                    'install', 'repoze.what-quickstart'], stdout=devnull)
    print "You now have to activate the environment and lauch the bitten-slave"
    devnull.close()
"""))
f = open('build_bootstrap.py', 'w').write(output)
