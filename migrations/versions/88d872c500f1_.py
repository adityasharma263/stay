"""empty message

Revision ID: 88d872c500f1
Revises: 91daf72a3527
Create Date: 2019-08-24 14:56:26.643543

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '88d872c500f1'
down_revision = '91daf72a3527'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('facility', 'bed_type')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('facility', sa.Column('bed_type', sa.INTEGER(), autoincrement=False, nullable=True))
    # ### end Alembic commands ###
