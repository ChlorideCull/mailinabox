#!/bin/bash
# This script is run daily (at 3am each night).

# Take a backup.
management/backup.py

# Provision any new certificates for new domains or domains with expiring certificates.
management/ssl_certificates.py --headless

# Run status checks and email the administrator if anything changed.
management/status_checks.py --show-changes --smtp
