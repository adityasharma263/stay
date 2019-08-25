"""empty message

Revision ID: 91daf72a3527
Revises: 802fc5996861
Create Date: 2019-08-24 14:18:12.463993

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '91daf72a3527'
down_revision = '802fc5996861'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('hotel', sa.Column('slug', sa.String(length=255), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('hotel', 'slug')
    # ### end Alembic commands ###