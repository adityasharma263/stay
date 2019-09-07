"""empty message

Revision ID: 22ece43e598c
Revises: ff9b58f01a55
Create Date: 2019-09-06 12:44:07.813328

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql


# revision identifiers, used by Alembic.
revision = '22ece43e598c'
down_revision = 'ff9b58f01a55'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    status = postgresql.ENUM('P', 'F', 'S', name='status')
    status.create(op.get_bind())
    op.add_column('booking', sa.Column('status', sa.Enum('p', 'F', 'S', name='status'), nullable=True))
    op.drop_column('booking', 'contact_no')
    op.add_column('deal', sa.Column('b2b_lowest_price', sa.Boolean(), nullable=True))
    op.add_column('deal', sa.Column('b2c_lowest_price', sa.Boolean(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('deal', 'b2c_lowest_price')
    op.drop_column('deal', 'b2b_lowest_price')
    op.add_column('booking', sa.Column('contact_no', sa.VARCHAR(), autoincrement=False, nullable=True))
    op.drop_column('booking', 'status')
    status = postgresql.ENUM('P', 'F', 'S', name='status')
    status.drop(op.get_bind())
    # ### end Alembic commands ###