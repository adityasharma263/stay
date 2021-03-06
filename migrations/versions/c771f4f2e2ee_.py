"""empty message

Revision ID: c771f4f2e2ee
Revises: 42bd700fa350
Create Date: 2019-08-22 20:30:50.805823

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c771f4f2e2ee'
down_revision = '42bd700fa350'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('facility', 'jacuzzi')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('facility', sa.Column('jacuzzi', sa.INTEGER(), autoincrement=False, nullable=True))
    # ### end Alembic commands ###
