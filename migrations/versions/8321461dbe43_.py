"""empty message

Revision ID: 8321461dbe43
Revises: a82dba001689
Create Date: 2019-07-30 13:23:41.844339

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '8321461dbe43'
down_revision = 'a82dba001689'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('price_calendar',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('updated_at', sa.DateTime(timezone=True), nullable=True),
    sa.Column('price', sa.Integer(), nullable=True),
    sa.Column('date', sa.DateTime(), nullable=True),
    sa.Column('available', sa.Boolean(), nullable=True),
    sa.Column('deal_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['deal_id'], ['deal.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_price_calendar_id'), 'price_calendar', ['id'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_price_calendar_id'), table_name='price_calendar')
    op.drop_table('price_calendar')
    # ### end Alembic commands ###